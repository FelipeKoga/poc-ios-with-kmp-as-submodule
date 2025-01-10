# iOS App with KMP Shared Module and Git Submodules

This repository demonstrates how to set up an iOS app integrating a Kotlin Multiplatform (KMP) shared module using CocoaPods and Git submodules.

The KMP shared module used in this project can be found at: [https://github.com/FelipeKoga/poc-kmp-submodule](https://github.com/FelipeKoga/poc-kmp-submodule).

## Steps

1. **Create the iOS project**
   - Open Xcode, create a new project, and configure it as needed.

2. **Set up CocoaPods**
   - Install CocoaPods if not already installed:
     ```bash
     sudo gem install cocoapods
     ```
   - Navigate to your iOS project directory:
     ```bash
     cd /path/to/MyiOSProject
     ```
   - Initialize CocoaPods:
     ```bash
     pod init
     ```

3. **Add the KMP shared module as a submodule**
   - Add the KMP shared module repository as a submodule:
     ```bash
     git submodule add https://github.com/FelipeKoga/poc-kmp-submodule shared
     git submodule update --init --recursive
     ```
   - The project structure should now look like this:
     ```
     MyiOSProject/
     ├── MyiOSApp/
     ├── Pods/
     ├── Podfile
     ├── shared/
     │   ├── shared/
     │   │   └── shared.podspec
     ├── MyiOSProject.xcworkspace
     ```

4. **Generate the `.podspec` in the KMP module**
   - Navigate to the `shared` directory inside the submodule:
     ```bash
     cd shared/shared
     ```
   - Run the following command:
     ```bash
     ./gradlew podspec
     ```

5. **Edit the Podfile**
   - Open the `Podfile` and add the KMP shared module:
     ```ruby
     pod 'shared', :path => './shared/shared'
     ```

6. **Generate the dummy framework**
   - In the same directory (`shared/shared`), run:
     ```bash
     ./gradlew :shared:generateDummyFramework
     ```

7. **Install the pods**
   - Go back to the root of your iOS project and install the pods:
     ```bash
     cd /path/to/MyiOSProject
     pod install
     ```

8. **Success**
   - Open the `.xcworkspace` file:
     ```bash
     open MyiOSProject.xcworkspace
     ```
   - Import and use the shared module in your Swift code:
     ```swift
     import shared
     ```
