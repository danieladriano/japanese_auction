package japanese_ac;

import java.util.ArrayList;

// import jason.asSyntax.Atom;
import cartago.*;

public class ArenaArtifact extends Artifact {

    double productValue = 0;
    ArrayList<String> participants = new ArrayList();

    public void init() {
        defineObsProperty("product_value", productValue);
        defineObsProperty("participants_size", 0);

        System.out.println("INIT");
    }

    @OPERATION public void initiateArena(double value) {
        getObsProperty("product_value").updateValue(value);
        productValue = value;
        print("Initiate arena with value $" + productValue);
        signal("initiate_arena");
    }

    @OPERATION public void updateValue(double newValue) {
        getObsProperty("product_value").updateValue(newValue);
        signal("value_updated");
    }

    @OPERATION public void winner(OpFeedbackParam name) {
        name.set(participants.get(0));
        signal("winner", participants.get(0));
    }

    @OPERATION public void joinArena(String name){
        print("Welcome " + name + "!!");
        participants.add(name);

        getObsProperty("participants_size").updateValue(participants.size());
    }

    @OPERATION public void exitArena(String name){
        participants.remove(name);
        getObsProperty("participants_size").updateValue(participants.size());
    }

    public void print(String text){
        System.out.println("[arena] " + text);
    }

}