Summary: Include screen shots or a video of your app highlighting its features

Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?

I prioritized the UI making sure to follow Apple design tips, as well as making a comprehensive protocol oriented network layer. I chose to focus on these areas because they are key factors in the adoption of a mobile application as well as driving performance and usability of the application, respectively.

Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?

I spent a total of three 3 hour blocks to complete this project. I first completed a basic working application and then detailed out the networking and UI aspects, adding caching last.

Trade-offs and Decisions: Did you make any significant trade-offs in your approach?

My network layer design was based on a protocol oriented approach with a generic fetch method, two benefits were better testabilty through protocol abstraction and type safety with generics.

I decided to design the architecture in a MVVM approach as that is what I'm most familiar with, key benefits would be clear separation of concerns, managable state, and taking advantage of SwiftUI's data-independent views that seamlessly align with the view layer of the MVVM pattern as well as SwiftUI's mechanisms to bind views to data and automatically update the user interface when the underlying data changes.

I implemented modern Swift concurrency using async/await and actors resulting in cleaner, more readable code. 

Weakest Part of the Project: What do you think is the weakest part of your project?

The weakest part of the project would be the error handling and minimal use of loading states.

Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

I think the project requirements were presented in a simple and appropriate manner and as I worked on the application the complexity grew as I wanted to show my knowledge and skillset as it stands.
