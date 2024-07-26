import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chililabs_gifsearch/core/services/network_connectivity_service.dart';
import 'package:chililabs_gifsearch/core/common/providers/gif_provider.dart';

class NetworkAwareWidget extends StatefulWidget {
  final Widget child;

  const NetworkAwareWidget({super.key, required this.child});

  @override
  State<NetworkAwareWidget> createState() => _NetworkAwareWidgetState();
}

class _NetworkAwareWidgetState extends State<NetworkAwareWidget> {
  bool _isErrorDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    final networkConnectivityService = Provider.of<NetworkConnectivityService>(context);
    final gifProvider = Provider.of<GifProvider>(context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if ( !networkConnectivityService.connectionStatus.contains(ConnectivityResult.none)
           && gifProvider.errorMessage != null
           && !_isErrorDialogShowing
         ) {
        _showErrorDialog(context, gifProvider.errorMessage!);
        gifProvider.clearErrorMessage();
      }
    });

    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          if (networkConnectivityService.connectionStatus.contains(ConnectivityResult.none))
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'No Internet Connection',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    setState(() {
      _isErrorDialogShowing = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _isErrorDialogShowing = false;
                });
              },
            ),
          ],
        );
      },
    ).then((_) {
      if (mounted) {
        setState(() {
          _isErrorDialogShowing = false;
        });
      }
    });
  }
}