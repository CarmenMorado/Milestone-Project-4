# Milestone-Project-4
100 Days of Swift (Milestone Project 4) App that allows users to take photos of things that interest them, add captions to them, then shows those photos in a table view.

Challenge:
Your challenge is to put two different projects into one: I’d like you to let users take photos of things that interest them, add captions to them, then show 
those photos in a table view. Tapping the caption should show the picture in a new view controller, like we did with project 1. So, your finished project needs 
to use elements from both project 1 and project 12, which should give you ample chance to practice.

This will require you to use the picker.sourceType = .camera setting for your image picker controller, create a custom type that stores a filename and a caption, 
then show the list of saved pictures in a table view. Remember: using the camera is only possible on a physical device.

Here are some hints in case you hit problems:
-You’ll need to make ViewController build on UITableViewController rather than just UIViewController.
-Just like in project 10, you should create a custom type that stores an image filename and a caption string, then use either Codable or NSCoding to load and save that.
-Use a UIAlertController to get the user’s caption for their image – a single text field is enough.
-You’ll need to design your detail view controller using Interface Builder, then call instantiateViewController to load it when a table view row is tapped.

![ezgif-3-bd89baf48758](https://user-images.githubusercontent.com/42749527/104375192-f721be00-54f0-11eb-927a-066d1c8205c8.gif)


