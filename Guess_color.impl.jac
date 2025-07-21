impl colorGuess.start {
    if not [root --> (`?GameSession)] {
        
        next = root ++> GameSession(2);
        print(f"Starting new Color Guessing Game! 🎨");
        print(f"You can select from the given colors");
        print("=" * 50);
    } else {
        next = [root --> (`?GameSession)];
        print(f"🔄 Continuing epic quest");
    }
    visit next;
}

impl colorGuess.process_guess {

    available_colors = ["Red", "Blue", "Yellow", "Green", "Purple", "Orange", "Pink", "Black", "White", "Brown", "Gray", "Cyan", "Magenta"];
    temp_number = random.randint(1, len(available_colors) - 2);

    print(f"1. {available_colors[temp_number-1]}");
    print(f"2. {available_colors[temp_number]}");
    print(f"3. {available_colors[temp_number+1]}");

    color = available_colors[temp_number -1 + random.randint(0, 2)];

    guess = input(f"Enter your guess : ");
    if [-->] {
        visit [-->];
    } else {
        if guess != color {
            here.attempts_left -= 1;
            if here.attempts_left > 0 {
                print(f"❌ Oops! '{guess}' is not correct!");
                print(f"💪 Attempts left: {here.attempts_left}");
                
                # Generate AI hint 
                hint = give_color(guess, color, 4 - here.attempts_left);
                print(f"💡 AI Hint: {hint}");
                print("🔄 Keep trying! You've got this! ");
                print("-" * 40);
                
                here ++> GameSession(here.attempts_left);
            } else {
                print(f"💀 Game Over! No more attempts left! ");
                print(f"🎯 The correct color was: {color}");
                print(f"🎮 Better luck next time, adventurer! 🍀");
                print("=" * 50);
                disengage;
            }
        } else {
            print(f"CONGRATULATIONS! 🎉");
            print(f"You guessed '{guess}' correctly! 🏆");
            print(f"You are an Color Guessing Champion! 🌟");
            print("=" * 50);
            disengage;
        }
        visit [-->];
    }
}