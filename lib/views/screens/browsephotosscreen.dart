import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

import 'package:pixellery/dataclass/dataclass.dart';
import 'package:pixellery/models/models.dart';
import 'package:pixellery/views/screens/picturedetailsscreen.dart';

class BrowsePhotosScreen extends StatefulWidget {
  const BrowsePhotosScreen({super.key});

  @override
  State<BrowsePhotosScreen> createState() => _BrowsePhotosScreenState();
}

class _BrowsePhotosScreenState extends State<BrowsePhotosScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();
  bool _showNextPageButton = false;
  Future<List<PexelsPhoto>>? curatedPhotos;

  @override
  void initState() {
    curatedPhotos = Provider.of<DataClass>(context, listen: false).shared;
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _showNextPageButton = true;
      });
    } else {
      setState(() {
        _showNextPageButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataClass>(
      builder: (context, value, child) => FutureBuilder(
        future: curatedPhotos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'There was an error loading pictures',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    Text('Check your internet connection and try again',
                        style: TextStyle(fontSize: 14.sp)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          backgroundColor: Colors.black),
                      onPressed: () {
                        setState(() {
                          curatedPhotos =
                              Provider.of<DataClass>(context, listen: false)
                                  .fetchPictures(value.pageNumber);
                        });
                      },
                      child: Text('Retry', style: TextStyle(fontSize: 14.sp)),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasData) {
              return Stack(
                children: [
                  GridView.builder(
                    controller: _scrollController,
                    itemCount: snapshot.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 5 / 7, crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0).w,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return DetailScreen(
                                    imageUrl: snapshot.data![index].imageUrl,
                                    photographer:
                                        snapshot.data![index].photographer,
                                    liked: snapshot.data![index].liked);
                              },
                            ));
                          },
                          child: Stack(fit: StackFit.expand, children: [
                            CachedNetworkImage(
                                fit: BoxFit.cover,
                                memCacheHeight: 400,
                                memCacheWidth: 300,
                                errorWidget: (context, url, error) {
                                  return Image.asset(
                                      "assets/images/error-image-photo-icon.png");
                                },
                                placeholder: (context, url) => Center(
                                      child: SizedBox(
                                        height: 50.w,
                                        width: 50.w,
                                        child: const CircularProgressIndicator(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                imageUrl: snapshot.data![index].imageUrl),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0).w,
                                child: CircleAvatar(
                                  radius: 20.w,
                                  backgroundColor:
                                      Colors.grey.shade100.withOpacity(0.9),
                                  child: IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                              'Downloading to Gallery...',
                                              style:
                                                  TextStyle(fontSize: 14.sp)),
                                        ),
                                      );
                                      download() async {
                                        await GallerySaver.saveImage(
                                            snapshot.data![index].imageUrl,
                                            albumName: 'Pixellery');
                                      }

                                      download().then((value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Downloaded to gallery!',
                                                style:
                                                    TextStyle(fontSize: 14.sp)),
                                          ),
                                        );
                                        setState(() {
                                          snapshot.data![index].downloaded =
                                              true;
                                        });
                                      });
                                    },
                                    icon: (snapshot.data![index].downloaded)
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
                                  backgroundColor:
                                      Colors.grey.shade100.withOpacity(0.9),
                                  child: IconButton(
                                    splashRadius: 20.w,
                                    onPressed: () {
                                      var snapx = snapshot.data![index];
                                      setState(() {
                                        snapx.liked = !snapx.liked;
                                      });
                                      Provider.of<DataClass>(context,
                                              listen: false)
                                          .save(
                                              snapshot.data![index].id,
                                              snapshot.data![index].imageUrl,
                                              snapshot
                                                  .data![index].photographer,
                                              snapshot.data![index].downloaded,
                                              snapshot.data![index].liked,
                                              snapshot.data![index].alt);
                                    },
                                    icon: (snapshot.data![index].liked)
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
                        ),
                      );
                    },
                  ),
                  if (_showNextPageButton)
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.black),
                        onPressed: () {
                          int lenx = snapshot.data!.length;
                          if (lenx >= 40) {
                            value.pageNumber++;
                            setState(() {
                              curatedPhotos =
                                  Provider.of<DataClass>(context, listen: false)
                                      .fetchPictures(value.pageNumber);
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('End of results!',
                                    style: TextStyle(fontSize: 14.sp)),
                              ),
                            );
                          }
                        },
                        child: Text('Next Page',
                            style: TextStyle(fontSize: 14.sp)),
                      ),
                    ),
                ],
              );
            }
          }
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        },
      ),
    );
  }
}
