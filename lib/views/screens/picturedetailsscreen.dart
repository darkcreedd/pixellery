import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:icofont_flutter/icofont_flutter.dart';

// ignore: must_be_immutable
class DetailScreen extends StatefulWidget {
  DetailScreen(
      {super.key,
      required this.imageUrl,
      required this.photographer,
      required this.liked});
  String imageUrl;
  String photographer;
  bool liked;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool downloaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Pixellery',
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                placeholder: (context, url) => Center(
                  child: SizedBox(
                      height: 50.h,
                      width: 50.h,
                      child: const CircularProgressIndicator(
                        color: Colors.black,
                      )),
                ),
                imageUrl: widget.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              constraints: BoxConstraints(minHeight: 50.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.colorBurn,
                color: Colors.grey[900],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 90,
                      child: Text(
                        'Photographer: ${widget.photographer}',
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Downloading to Gallery...',
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      );
                      download() async {
                        await GallerySaver.saveImage(widget.imageUrl,
                            albumName: 'Pixellery');
                      }

                      download().then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Downloaded to gallery!',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ));
                      setState(() {
                        downloaded = true;
                      });
                    },
                    icon: (downloaded)
                        ? Icon(
                            Icons.download_done_outlined,
                            color: Colors.black,
                            size: 25.sp,
                          )
                        : Icon(
                            IcoFontIcons.download,
                            size: 25.sp,
                            color: Colors.black,
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
