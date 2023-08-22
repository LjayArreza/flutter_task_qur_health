# Flutter task for Qur Health

## Code Structure
```
-- lib
    -- data
        -- character_repository.dart
    -- domain
        -- character_model.dart
    -- presentation
        -- bloc
            -- character_bloc.dart
            -- character_event.dart
            -- character_state.dart
        -- ui
            -- character_screen.dart
            -- character_details_screen.dart
    -- main.dart
```

## Data Layer:
In the data layer, i have a **CharacterRepository** class responsible for handling data retrieval from an external source, in this case, the Rick and Morty API using the Dio package. The repository encapsulates the data fetching logic and exposes a method fetchCharacters() that returns a **Future<Characters>**. This method sends a GET request to the API and then maps the API response to a Characters object using the fromJson() method.

## Domain Layer:
My domain layer consists of the data models that represent the core domain of my application, in this case, **character_model.dart**. These models define the structure of the data im working with. 

## Presentation Layer:
In this layer, i'm using the BLoC (Business Logic Component) pattern to manage the application's state and business logic related to characters.

## 2.1 Bloc:
The CharacterBloc class extends Bloc<CharacterEvent, CharacterState>. It takes a CharacterRepository as a dependency and manages different states based on the events received. Here's an overview of its parts:

**Constructor:** The constructor initializes the bloc with an initial state (CharacterInitial) and sets up event handlers using the on method from the flutter_bloc package.

**_fetchCharacters Method:** This method is called when a FetchCharacters event occurs. It updates the state to CharacterLoading, fetches characters from the repository, applies filters to the characters based on the event's filter parameters, and updates the state to CharacterLoaded with the filtered characters. If there's an error, it updates the state to CharacterError.

**_applyFilters Method:** This method applies filters to a list of characters based on the filter parameters provided. It checks if the character's name, species, and status match the filter values, and returns a new list of filtered characters.

**mapEventToState Method:** This method is an alternative way of handling events and updating states. It listens to events and yields corresponding states. In my implementation, i'm fetching characters and updating the state to CharacterLoaded or CharacterError based on the success or failure of the fetch operation.

## 2.2 Event and State Classes:

**Event Classes:** CharacterEvent is an abstract class representing events related to characters. In my example, i have FetchCharacters event class that carries filter parameters like nameFilter, speciesFilter, and statusFilter.

**State Classes:** CharacterState is an abstract class representing different states of the character-related UI. I have several state classes: CharacterInitial, CharacterLoading, CharacterLoaded, and CharacterError, each representing a different state of my UI.





