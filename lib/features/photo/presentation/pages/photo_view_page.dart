import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hananote/app/di/injection.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/error/failures.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:hananote/features/photo/domain/entities/photo_entry.dart';
import 'package:hananote/features/photo/domain/usecases/delete_photo.dart';
import 'package:hananote/features/photo/domain/usecases/load_photo_full.dart';
import 'package:intl/intl.dart';

/// Extra payload used when opening the photo viewer route.
class PhotoViewRouteExtra {
  /// Creates a [PhotoViewRouteExtra].
  const PhotoViewRouteExtra({
    required this.entry,
    this.initialThumbnail,
  });

  /// Photo entry to display.
  final PhotoEntry entry;

  /// Optional thumbnail bytes reused while the full image decrypts.
  final Uint8List? initialThumbnail;
}

/// Full-resolution encrypted photo viewer.
class PhotoViewPage extends StatefulWidget {
  /// Creates a [PhotoViewPage].
  const PhotoViewPage({
    required this.entry,
    this.initialThumbnail,
    super.key,
  });

  /// Entry being viewed.
  final PhotoEntry entry;

  /// Cached thumbnail shown while the full image decrypts.
  final Uint8List? initialThumbnail;

  @override
  State<PhotoViewPage> createState() => _PhotoViewPageState();
}

class _PhotoViewPageState extends State<PhotoViewPage> {
  late final LoadPhotoFull _loadPhotoFull = getIt<LoadPhotoFull>();
  late final DeletePhoto _deletePhoto = getIt<DeletePhoto>();

  Uint8List? _imageBytes;
  String? _errorMessage;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: HanaColors.inverseSurface,
      appBar: AppBar(
        backgroundColor: HanaColors.inverseSurface,
        foregroundColor: HanaColors.inverseOnSurface,
        title: Text(DateFormat('yyyy.MM.dd').format(widget.entry.date)),
        actions: [
          IconButton(
            onPressed: _isDeleting ? null : () => _confirmDelete(context),
            icon: _isDeleting
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _buildImageArea(context),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
            decoration: BoxDecoration(
              color: HanaColors.inverseOnSurface,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: HanaColors.inverseSurface.withAlpha(40),
                  blurRadius: 16,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if ((widget.entry.notes ?? '').trim().isNotEmpty) ...[
                  Text(
                    l10n.notes,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: HanaColors.onSurfaceVariant,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.entry.notes!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                ],
                Text(
                  '${l10n.fileSize}: '
                  '${_formatFileSize(widget.entry.originalSizeBytes)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: HanaColors.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea(BuildContext context) {
    if (_imageBytes != null) {
      return InteractiveViewer(
        maxScale: 4,
        child: Hero(
          tag: 'photo-${widget.entry.id}',
          child: Image.memory(
            _imageBytes!,
            fit: BoxFit.contain,
            gaplessPlayback: true,
          ),
        ),
      );
    }

    if (_errorMessage != null) {
      final l10n = AppLocalizations.of(context)!;
      return Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.broken_image_outlined,
              color: HanaColors.inverseOnSurface,
            ),
            const SizedBox(height: 12),
            Text(
              _errorMessage!,
              style: const TextStyle(color: HanaColors.inverseOnSurface),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _loadImage,
              child: Text(l10n.retry),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        if (widget.initialThumbnail != null)
          Hero(
            tag: 'photo-${widget.entry.id}',
            child: Image.memory(
              widget.initialThumbnail!,
              fit: BoxFit.contain,
              gaplessPlayback: true,
            ),
          )
        else
          Container(
            width: 220,
            height: 220,
            decoration: BoxDecoration(
              color: HanaColors.inverseOnSurface.withAlpha(16),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Icon(
              Icons.photo_outlined,
              color: HanaColors.inverseOnSurface,
              size: 72,
            ),
          ),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: HanaColors.inverseSurface.withAlpha(120),
            shape: BoxShape.circle,
          ),
          child: const CircularProgressIndicator(
            color: HanaColors.inverseOnSurface,
          ),
        ),
      ],
    );
  }

  Future<void> _loadImage() async {
    setState(() {
      _imageBytes = null;
      _errorMessage = null;
    });

    final result = await _loadPhotoFull(widget.entry);
    if (!mounted) {
      return;
    }

    result.fold(
      (failure) {
        setState(() {
          _errorMessage = failureMessage(failure);
        });
      },
      (imageBytes) {
        setState(() {
          _imageBytes = imageBytes;
        });
      },
    );
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.photoDeleteTitle),
        content: Text(l10n.photoDeleteMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (!(confirmed ?? false) || !mounted) {
      return;
    }

    setState(() {
      _isDeleting = true;
    });

    final result = await _deletePhoto(widget.entry);
    if (!mounted) {
      return;
    }

    result.fold(
      (failure) {
        setState(() {
          _isDeleting = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failureMessage(failure))),
        );
      },
      (_) => Navigator.of(context).pop(true),
    );
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) {
      return '$bytes B';
    }
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}
