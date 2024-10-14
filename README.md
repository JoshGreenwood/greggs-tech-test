# greggs_sausage_roll

An app for sausage roll lovers.

## Running the project

This project was written using flutter `Flutter 3.24.3` and makes use of `build_runner`, therefore in
order to run the project please run `flutter pub get` followed by `dart run build_runner build`.

This will generate mocks and boilerplate necessary tto run the project.

### Running the tests

At the root of the project, run `flutter test`. To run the UI tests run `flutter test integration_test`, 
ensure a device or emulator is on and findable by flutter.

## Approach

Clean architecture is used as the basis of the project structure, keeping concerns such as data,
presentation, ui and domain separate. This makes testing easy and reacting to changes in services or requirements quick.
Unit testing has been used where feasible, alongside UI tests using `integration test`.

This project makes heavy use of generated code. Going forward, most of these this can become cumbersome, most of this could be changed. The addition of dart macros in the future will also alleviate any dependency on `build_runner`.


### Immutability

I generally like to try and keep most entities immutable where possible. I find this makes debugging easier. In order to generate a lot of boilerplate, freezed has been used.


### Result
I generally try to make error handling as easy as possible for myself.
This is why I implement classes such as `Result.dart`, this encapsulates 
both failure and success paths in a single typesafe class. It also keeps code cleaner,
reducing the need for a lot of try catch blocks.


## Packages Used

* flutter_bloc - To manage our state and keep our widgets simple.
* freezed_annotation - To generate boilerplate for for equality and copying objects.
* get_it - To simplify dependency injection
* decimal - Used to represent currency/money opposed to double.
* cached_network_image - Cache images
* mockito - Used to generate mocks for tests (Not necessary but prevents the need to write your own mocks).