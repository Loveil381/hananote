import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hananote/app/theme/hana_colors.dart';
import 'package:hananote/core/l10n/arb/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Full-screen WebView page for the HRT knowledge base.
class KnowledgeWebViewPage extends StatefulWidget {
  /// Creates a [KnowledgeWebViewPage].
  const KnowledgeWebViewPage({super.key});

  /// The URL of the HRT knowledge base.
  static const String url = 'https://hrtyaku.com';

  @override
  State<KnowledgeWebViewPage> createState() => _KnowledgeWebViewPageState();
}

class _KnowledgeWebViewPageState extends State<KnowledgeWebViewPage> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

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
                  icon:
                      const Icon(Icons.refresh, color: HanaColors.primary),
                  onPressed: () => _controller.reload(),
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
            child: WebViewWidget(controller: _controller),
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
