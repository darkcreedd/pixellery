import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:pixellery/dataclass/dataclass.dart';
import 'package:provider/provider.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(
      builder: (context, value, child) => Visibility(
        visible: value.savedList.isNotEmpty,
        replacement: Center(
          child: Text(
            'No liked images to display',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontSize: 14.sp),
          ),
        ),
        child: GridView.builder(
          itemCount: value.savedList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 5 / 7, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0).w,
              child: Stack(fit: StackFit.expand, children: [
                CachedNetworkImage(
                    fit: BoxFit.cover,
                    memCacheHeight: 400,
                    memCacheWidth: 300,
                    placeholder: (context, url) => Center(
                          child: SizedBox(
                            height: 50.w,
                            width: 50.w,
                            child: const CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          ),
                        ),
                    imageUrl: value.savedList[index].imageUrl),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0).w,
                    child: CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Colors.grey.withOpacity(0.9),
                      child: IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Downloading to Gallery...',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.sp),
                              ),
                            ),
                          );
                          download() async {
                            await GallerySaver.saveImage(
                                value.savedList[index].imageUrl,
                                albumName: 'Pixellery');
                          }

                          download().then((value) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Downloaded to gallery!',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14.sp)),
                                ),
                              ));
                          setState(() {
                            value.savedList[index].downloaded = true;
                          });
                        },
                        icon: (value.savedList[index].downloaded)
                            ? Icon(
                                Icons.download_done_outlined,
                                color: Colors.black,
                                size: 24.sp,
                              )
                            : Icon(
                                IcoFontIcons.download,
                                color: Colors.black,
                                size: 24.sp,
                              ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0).w,
                    child: CircleAvatar(
                      radius: 20.w,
                      backgroundColor: Colors.grey.withOpacity(0.9),
                      child: IconButton(
                        splashRadius: 20.w,
                        onPressed: () {
                          var snapx = value.savedList[index];
                          setState(() {
                            snapx.liked = !snapx.liked;
                          });
                          Provider.of<DataClass>(context, listen: false)
                              .unsave(value.savedList[index].id);
                        },
                        icon: (value.savedList[index].liked)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 24.sp,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 24.sp,
                              ),
                      ),
                    ),
                  ),
                ),
              ]),
            );
          },
        ),
      ),
    );
  }
}
