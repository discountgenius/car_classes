# CarClass

Some code John wrote as part of [REVdata](http://revdata.com), stripped down to its bare essentials as a public code example.

### Problem

The Version has a string field called vclass that says what type of car the Version is. This string has not been validated and there are duplicate spellings of the same type of car (example: "Compact Car" vs. "Compact Cars" vs "Compact") that need to be able to be merged. I want to build a model called CarClass to handle these values. I also want to still cache the value in vclass so I don't have to change any of the display code at this time.

### Steps

Step one (after building the CarClass scaffold and adding a car_class_id field to the versions table) was to write the methods in the Version model that populate the car_classes table and link the existing Versions to the new CarClasses.

Step two was to clean up the car_classes views and write the model method, controller actions and view required to allow CarClasses to be easily merged together.

Step three was to write the methods in the Version model and the CarClass model that handle automatically caching the name of the car_class back in the original vclass field. This way any merges or name changes or deletions propogate back to the original field and the proper value is displayed to the end user.

