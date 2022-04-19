walker talker {
    has utterance;

    state {
        std.out(here.message, here.prompts);

        utterance = std.input("> ");

        take -[transition(intent == utterance)]-> node::state else{
            take here;

            if(utterance == "quit"): disengage;
        }
    }
}