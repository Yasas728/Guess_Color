import random;
import from mtllm.llm { Model }

glob llm = Model(model_name="gemini/gemini-2.0-flash", verbose=False);

def give_color(guess: str, color: str, attempt_number: int) -> str by llm();

walker colorGuess {

    can start with `root entry;
    can process_guess with GameSession entry;
}

node GameSession {
    #has color: str;
    has attempts_left: int = 2;
}

# Will run when in CLI mode 
with entry:__main__ {
    i = "8";
    while i == "8" {
        root spawn colorGuess();
        i = input("Press 8 to continue: ");
    }
}