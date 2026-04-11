import 'dart:ui';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Full-screen WebView page for the HRT knowledge base.
///
/// On web, opens the URL in a new browser tab instead of using WebView.
class KnowledgeWebViewPage extends StatefulWidget {
  /// Creates a [KnowledgeWebViewPage].
  const KnowledgeWebViewPage({super.key});

  /// The URL of the HRT knowledge base.
  static const String url = 'https://hrtyaku.com';

  @override
  State<KnowledgeWebViewPage> createState() => _KnowledgeWebViewPageState();
}

class _KnowledgeWebViewPageState extends State<KnowledgeWebViewPage> {
  WebViewController? _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // On web, open in new tab and pop back
      WidgetsBinding.instance.addPostFrameCallback((_) {
        launchUrl(
          Uri.parse(KnowledgeWebViewPage.url),
          mode: LaunchMode.externalApplication,
        );
        if (mounted) context.pop();
      });
    } else {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) {
              if (mounted) setState(() => _isLoading = true);
            },
            onPageFinished: (_) {
              if (mounted) setState(() => _isLoading = false);
            },
          ),
        )
        ..loadRequest(Uri.parse(KnowledgeWebViewPage.url));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // On web, show a brief loading screen before redirect
    if (kIsWeb) {
      return Scaffold(
        backgroundColor: HanaColors.background,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(color: HanaColors.primary),
              const SizedBox(height: 16),
              Text(
                l10n.knowledgeBase,
                style: const TextStyle(color: HanaColors.onSurfaceVariant),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: HanaColors.background,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: AppBar(
              backgroundColor:
                  HanaColors.background.withAlpha((255 * 0.8).round()),
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: HanaColors.primary),
                onPressed: () => context.pop(),
              ),
              title: Text(
                l10n.knowledgeBase,
                style: const TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: HanaColors.primary,
                  letterSpacing: -0.5,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh, color: HanaColors.primary),
                  onPressed: () => _controller?.reload(),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + kToolbarHeight,
            ),
            child: _controller != null
                ? WebViewWidget(controller: _controller!)
                : const SizedBox.shrink(),
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: HanaColors.primary),
            ),
        ],
      ),
    );
  }
}
