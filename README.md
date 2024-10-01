Instructions to run the project:

1) Download or clone project from the repository pointing to the "main" branch.
2) Open the project in Xcode. Allow the program to download the Swift Package Manager packages necessary for its operation.
3) When the "Ready" or "Build Successful" message appears, run the project by pressing the play button or with cmd + R.

Instructions for using the application

1) Type 3 or more characters inside the search bar to find out your results.
2) Once your result is shown, tap the desired artist to view their details.
3) To view the artist's albums, click on the "albums" menu section.
4) To view the album's tracklist, click on the desired album from the list.
4.1) To filter the albums by another parameter, tap the ellipses button on the top right corner to filter by the available options.

Architecture selection for project = **MVVM**

The MVVM architecture selection for the project offers key benefits like a clear separation of concerns between the UI, business logic, and data handling. It improves testability by isolating logic in the ViewModel, and SwiftUI's reactive nature ensures automatic UI updates when data changes. MVVM promotes code reusability, reduces duplication, and supports scalability as projects grow. Additionally, it enables better collaboration between developers and designers, allowing each to focus on their area without interfering with the other, leading to cleaner, more maintainable, and efficient code.

Brief description

The project's main development process was inspired from a combination of Apple Music's and Spotify's user flow. The homeView, artistDetailsView, and albumDetailsView are inspired from Apple Music meanwhile the albumsView was from Spotify.

The main analysis for the created app is based on what was requested, at most, from the mobile challenge document as well as the available data from the Discogs API. Due to the limitations of Discogs' API, some full functionality from the inspired apps was not able to be replicated.
