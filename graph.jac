node state {
    has title;
    has message;
    has prompts;
}


edge transition {
    has intent;
}

graph main_graph {
    has anchor main_root;
    

    spawn{
        main_root = spawn node::state(
                        title = "Greeting",
                        message = "Welcome to Acme Salon! How may I be of assistance today?",
                        prompts = ["General Business Queries", "Make an Appointment", "Services Available", "quit"]
                  );
        General_Business_Queries = spawn main_root -[transition(intent="General Business Queries")]-> node::state(
                                        title = "General Business Queries",
                                        message = "What would you like to know?",
                                        prompts = ["Office Hours", "Payment Methods", "Contact Information", "Promotions", "quit"]
                    );
                    General_Business_Queries -[transition(intent="back")]-> main_root;

           Office_Hours = spawn General_Business_Queries -[transition(intent="Office Hours")] -> node::state(
                                        title = "Office Hours",
                                        message = "We are open on Monday to Friday from 9am - 4pm. NB: We are not open on weekends or holidays",
                                        prompts = ["back"]
                    );
                    Office_Hours -[transition(intent="back")]-> General_Business_Queries;

            Payment_Methods= spawn General_Business_Queries -[transition(intent="Payment Methods")]-> node::state(
                                        title = "Payment Methods",
                                        message = "You can pay using your visa card or cash directly, at our main location.",
                                        prompts = ["back"]
                    );
                    Payment_Methods -[transition(intent="back")]-> General_Business_Queries;

            Contact_Information = spawn General_Business_Queries -[transition(intent="Contact Information")]-> node::state(
                                        title = "Contact Information",
                                        message = "You can contact us on 222-0000/670-0000 or via email (acmesalon.gy.org)",
                                        prompts = ["back"]
                    );
                    Contact_Information -[transition(intent="back")]-> General_Business_Queries;

            Promotions = spawn General_Business_Queries -[transition(intent="Promotions")]-> node::state(
                                        title = "Promotions",
                                        message = "Want to look your best this Spring? No problem, we got you! Make an appointment for any four our services and receive a 20% discount.",
                                        prompts = ["back"]
                    );
                    Promotions -[transition(intent="back")]-> General_Business_Queries;

        Make_an_Appointment = spawn main_root -[transition(intent="Make an Appointment")]-> node::state(
                                        title = "Make an Appointment",
                                        message = "Ok. Which one of our services would you like to have done?",
                                        prompts = ["Manicure", "Pedicure", "Spa", "Wedding Makeup", "Eyebrow Treatment", "Facial Treatment", "Haircut", "Hair Steaming", "quit"]
                        );
            Manicure = spawn Make_an_Appointment -[transition(intent="Manicure")]-> node::state(
                                        title = "Manicure",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Manicure -[transition(intent="back")]-> Make_an_Appointment;

            Pedicure = spawn Make_an_Appointment -[transition(intent="Pedicure")]-> node::state(
                                        title = "Manicure",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Pedicure -[transition(intent="back")]-> Make_an_Appointment;

            Spa = spawn Make_an_Appointment -[transition(intent="Spa")]-> node::state(
                                        title = "Spa",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Spa -[transition(intent="back")]-> Make_an_Appointment;

            Wedding_Makeup = spawn Make_an_Appointment -[transition(intent="Wedding Makeup")]-> node::state(
                                        title = "Wedding Makeup",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Wedding_Makeup -[transition(intent="back")]-> Make_an_Appointment;

            Eyebrow_Treatment = spawn Make_an_Appointment -[transition(intent="Eyebrow Treatment")]-> node::state(
                                        title = "Eyebrow Treatment",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Eyebrow_Treatment -[transition(intent="back")]-> Make_an_Appointment;

            Facial_Treatment = spawn Make_an_Appointment -[transition(intent="Facial Treatment")]-> node::state(
                                        title = "Facial Treatment",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Facial_Treatment -[transition(intent="back")]-> Make_an_Appointment;

            Haircut = spawn Make_an_Appointment -[transition(intent="Haircut")]-> node::state(
                                        title = "Haircut",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Haircut -[transition(intent="back")]-> Make_an_Appointment;

            Hair_Steaming = spawn Make_an_Appointment -[transition(intent="Hair Steaming")]-> node::state(
                                        title = "Hair Steaming",
                                        message = "Great choice! Please specify the date and time you would like to have it done. Note: All appointments must be made three working days in advance. Thanks for choosing us!",
                                        prompts = ["","back"]
                    );
                    Hair_Steaming -[transition(intent="back")]-> Make_an_Appointment;
                                
        Services_Available = spawn main_root -[transition(intent="Services Available")]-> node::state(
                                        title = "Services Available",
                                        message = "Which one of our services would you like to have done?",
                                        prompts = ["Manicure", "Pedicure", "Spa", "Wedding Makeup", "Eyebrow Treatment", "Facial Treatment", "Haircut", "Hair Steaming", "quit"]
                         );

            Manicure = spawn Services_Available -[transition(intent="Manicure")]-> node::state(
                                        title = "Manicure",
                                        message = "Let our professional manicurist help you strengthen, grow and repair your natural nails for only GY$25,000!",
                                        prompts = ["","back"]
                    );
                    Manicure -[transition(intent="back")]-> Services_Available;
                    Manicure -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Pedicure = spawn Services_Available -[transition(intent="Pedicure")]-> node::state(
                                        title = "Manicure",
                                        message = "Let our professional pedicurist help remove those rough skins with our special foot-care massage and cleaning for only GY$25,000!",
                                        prompts = ["Make an Appointment", "back"]
                    );
                    Pedicure -[transition(intent="back")]-> Services_Available;
                    Pedicure -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Spa = spawn Services_Available -[transition(intent="Spa")]-> node::state(
                                        title = "Spa",
                                        message = "Treat yourself like royalty with our Spa Days for only GY$45000",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Spa -[transition(intent="back")]-> Services_Available;
                    Spa -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Wedding_Makeup = spawn Services_Available -[transition(intent="Wedding Makeup")]-> node::state(
                                        title = "Wedding Makeup",
                                        message = "Get the perfect face-beat for that special day for only GY$20,000",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Wedding_Makeup -[transition(intent="back")]-> Services_Available;
                    Wedding_Makeup -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Eyebrow_Treatment = spawn Services_Available -[transition(intent="Eyebrow Treatment")]-> node::state(
                                        title = "Eyebrow Treatment",
                                        message = "Have your brows treated to perfection for prices ranging from GY$2,000 - $20,000 (depending on your choice)",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Eyebrow_Treatment -[transition(intent="back")]-> Services_Available;
                    Eyebrow_Treatment -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Facial_Treatment = spawn Services_Available -[transition(intent="Facial Treatment")]-> node::state(
                                        title = "Facial Treatment",
                                        message = "Get rid of those wrinkles, acnes, warts for prices ranging from GY$15,000 - 50,000 (depending on your choice)",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Facial_Treatment -[transition(intent="back")]-> Services_Available;
                    Facial_Treatment -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Haircut = spawn Services_Available -[transition(intent="Haircut")]-> node::state(
                                        title = "Haircut",
                                        message = "Have that perfect haircut for only GY$5,000",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Haircut -[transition(intent="back")]-> Services_Available;
                    Haircut -[transition(intent="Make an Appointment")]-> Make_an_Appointment;

            Hair_Steaming = spawn Services_Available -[transition(intent="Hair Steaming")]-> node::state(
                                        title = "Hair Steaming",
                                        message = "Treat your hair cuticles to the moisturization and treatments it deserves for only $15,000",
                                        prompts = ["Make an Appointment","back"]
                    );
                    Hair_Steaming -[transition(intent="back")]-> Services_Available;
                    Hair_Steaming -[transition(intent="Make an Appointment")]-> Make_an_Appointment;
    }
    
}