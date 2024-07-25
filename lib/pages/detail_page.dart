import 'package:flutter/material.dart';
import 'package:chililabs_gifsearch/core/common/widgets/network_image_widget.dart';
import 'package:chililabs_gifsearch/core/models/giphy_model.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  final GifData gif;

  const DetailPage({super.key, required this.gif});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // alter url to get low res avatar
    final avatarUrl = widget.gif.user?.avatarUrl.split(RegExp(r'\.(?=\w*$)')).join('/80h.');

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Text(
                        widget.gif.title,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: NetworkImageWidget(image: widget.gif.images.original),
                    )
                  ]
              ),)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                // Author's user data
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        avatarUrl ?? '',
                        errorBuilder: (context, exception, stackTrace) {
                          return Container(
                            color: Theme.of(context).colorScheme.surfaceContainer,
                            child:Center(
                              child: Text(
                                'No profile image',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).colorScheme.inverseSurface,
                                ),
                              ),
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (widget.gif.user?.displayName == ''
                            ? widget.gif.user?.username
                            : widget.gif.user?.displayName)
                          ??"By unknown user"
                        ),
                        InkWell(
                          child: Text(
                            widget.gif.user != null
                              ? '@${widget.gif.user!.username}'
                              : '',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          onTap: () {
                            if (widget.gif.user != null) {
                              launchUrl(Uri.parse(widget.gif.user!.profileUrl));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      // opens original gif in browser (to download)
                      launchUrl(Uri.parse('https://i.giphy.com/media/${widget.gif.id}/giphy.gif'));
                    },
                    icon: Icon(
                      Icons.open_in_browser,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
