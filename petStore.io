//Project 2 Part 2b
//Author: Ian Woodcock
//Date 2/11/2024

// Define the Animal object with name and sleep method
Animal := Object clone do(
    name := "Unnamed Animal"
    sleep := method(
        "Animal #{name} is sleeping." println
    )
)

// Define the Feline object with eat, play, and makeNoise methods
Feline := Animal clone do(
    eat := method(
        "Feline " ..(name).. " is eating." println
    )
    play := method(
        "Feline " ..(name).. " is playing." println
    )
    makeNoise := method(
        "Feline " ..(name).. " makes a noise." println
    )
)

// Define the Cat instances
Cat1 := Feline clone setSlot("name", "Fluffy")
Cat2 := Feline clone setSlot("name", "Whiskers")
Cat3 := Feline clone setSlot("name", "Mittens")

// Define the Canine object with eat, play, and makeNoise methods
Canine := Animal clone do(
    eat := method(
        "Canine " ..(name).. " is eating." println
    )
    play := method(
        "Canine " ..(name).. " is playing." println
    )
    makeNoise := method(
        "Canine " ..(name).. " makes a noise." println
    )
)

// Define the Dog instances
Dog1 := Canine clone setSlot("name", "Rex")
Dog2 := Canine clone setSlot("name", "Buddy")
Dog3 := Canine clone setSlot("name", "Max")

// Define the Staff object with arrive, lunch, and leave methods
Staff := Object clone do(
    arrive := method(
        "Staff member arrives." println
    )
    lunch := method(
        "Staff member goes for lunch." println
    )
    leave := method(
        "Staff member leaves." println
    )
)

// Define the Manager instance
Manager := Staff clone do(
    openStore := method(
        "Manager opens the store." println
        Cat1 makeNoise; Cat2 makeNoise; Cat3 makeNoise
        Dog1 makeNoise; Dog2 makeNoise; Dog3 makeNoise
    )
    closeStore := method(
        "Manager closes the store." println
        Cat1 sleep; Cat2 sleep; Cat3 sleep
        Dog1 sleep; Dog2 sleep; Dog3 sleep
    )
)

Clerk := Staff clone do(
    feedAnimals := method(
        "Clerk feeds the animals." println
        Cat1 eat; Cat2 eat; Cat3 eat
        Dog1 eat; Dog2 eat; Dog3 eat
    )
    playAnimals := method(
        "Clerk plays with the animals." println
        Cat1 play; Cat2 play; Cat3 play
        Dog1 play; Dog2 play; Dog3 play
    )
    sellAnimals := method(
        for(animal in list(Cat1, Cat2, Cat3, Dog1, Dog2, Dog3),
            if(Random value <= 0.20,
                "Sale: " .. animal name .. " was sold." println
				
                // Replace the sold animal with a new one
                if(animal proto == Feline,
                    newAnimal := Feline clone setSlot("name", "NewCat" .. Random value)
                    animal become newAnimal
                )
                if(animal proto == Canine,
                    newAnimal := Canine clone setSlot("name", "NewDog" .. Random value)
                    animal become newAnimal
                )
            )
        )
    )
)


// Define the Clock object with day, hour, and announceHour methods
Clock := Object clone do(
    day := 1
    hour := 800

    announceHour := method(        
        if(hour == 800,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Manager arrive
            Manager openStore
			hour = hour + 100
        )
        if(hour == 900,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Clerk arrive
            Clerk feedAnimals
			hour = hour + 100
        )
        if(hour == 1100,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Clerk playAnimals
			hour = hour + 100
        )
        if(hour == 1200,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Manager lunch
			hour = hour + 100
        )
        if(hour == 1300,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Clerk lunch
			hour = hour + 100
        )
        if(hour == 1600,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Clerk sellAnimals
			hour = hour + 100
        )
        if(hour == 1700,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Clerk leave
			hour = hour + 100
        )
        if(hour == 1800,
			"Day " ..(day).. ", Hour " ..(hour ).. ":" println
            Manager closeStore
            Manager leave
			hour = hour + 100
        )		
        if(hour >= 1900,			
            hour = 800
            day = day + 1
        )
    )
)

// Simulate the store running for three days
for(day, 1, 3,
    for(hour, 800, 1800,
        Clock announceHour
    )
)



//rescources used:
//https://iolanguage.org/
//https://en.wikibooks.org/wiki/Io_Programming
//ChatGPT 3.5 & 4.0 (only used as reference not for direct answer)