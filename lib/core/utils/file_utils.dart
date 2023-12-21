// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path/path.dart' as path;
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';

// class FileUtils {
//   static Future<bool> doesFileExist(String filePath) async {
//     return await File(filePath).exists();
//   }

//   static Future<File?> downloadFile(String fileUrl,
//       {bool openWhenDownload = false}) async {
//     Dio dio = Dio();
//     final appDir =
//         await getExternalStorageDirectories(type: StorageDirectory.downloads);
//     if (appDir == null || appDir.isEmpty) {
//       throw Exception('Failed to get downloads directory');
//     }
//     final filePath =
//         '${appDir.first.path}/${getFileNameFromUrl(fileUrl)}'; // Change the file extension based on the actual file type

//     final isFileExists = await doesFileExist(filePath);

//     if (isFileExists) {
//       if (openWhenDownload) {
//         openFile(File(filePath));
//         return File(filePath);
//       } else {
//         return File(filePath);
//       }
//     }

//     try {
//       await dio.download(fileUrl, filePath);
//       openFile(File(filePath));
//       return File(filePath);
//     } catch (e) {
//       // Handle any exceptions or errors here
//       throw Exception('Failed to download and open file: $e');
//     }
//   }

//   static String getFileNameFromUrl(String url) {
//     final uri = Uri.parse(url);
//     final segments = path.split(uri.path);
//     return segments.last;
//   }

//   static String getFileName(File file) {
//     String filePath = file.path;
//     String fileName = filePath.split('/').last;
//     return fileName;
//   }

//   static String getFileExtension(File file) {
//     String filePath = file.path;
//     String fileName = filePath.split('/').last;
//     String fileExtension = fileName.split('.').last;
//     return fileExtension;
//   }

//   static Future<void> openFile(File file) async {
//     OpenFile.open(file.path);
//   }

//   static writeLog(String text) async {
//     late Directory directory;
//     final List<Directory>? directories =
//         await getExternalStorageDirectories(type: StorageDirectory.downloads);
//     if (directories == null || directories.isEmpty) {
//       directory = await getApplicationDocumentsDirectory();
//     } else {
//       directory = directories.first;
//     }
//     final String dateTime = DateTime.now().toString();
//     final File file = File('${directory.path}/logs.txt');
//     debugPrint("Log written to: ${file.path}");
//     await file.writeAsString("$dateTime: $text\n", mode: FileMode.append);
//   }

//   static deleteLog() async {
//     final Directory directory = await getApplicationDocumentsDirectory();
//     final File file = File('${directory.path}/logs.txt');
//     await file.delete();
//   }

//   static Future<File?> moveFile(File file, Directory directory) async {
//     try {
//       String destinationPath =
//           '${directory.path}/${getFileName(file)}'; // Replace with the desired destination file path and name

//       // Create a File objects for source and destination
//       File sourceFile = file;
//       File destinationFile = File(destinationPath);

//       // Move the file by renaming it
//       await sourceFile.rename(destinationFile.path);
//       print('File moved successfully');
//       return destinationFile;
//     } catch (e) {
//       print('Error moving file: $e');
//       return null;
//     }
//   }
// }
