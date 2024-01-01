public class Limericks {
    String[] threeRhymer = { "There was a young lady of station\n", "I love man was her sole exclamation\n",
            "Isle of Man is the true explanation\n" };
    String[] twoRhymer = { "But when men cried, \"You flatter\"\n", "She replied, \"Oh! no matter!\n" };

    int randomNum(int min, int max) {
        return (int) (Math.random() * (max - min + 1) + min);
    }

    String threeRimeGen() {
        return threeRhymer[randomNum(0, threeRhymer.length - 1)];
    }

    String twoRimeGen() {
        return twoRhymer[randomNum(0, twoRhymer.length - 1)];
    }

    String randomSentence() {
        String sentence = threeRimeGen() + threeRimeGen() + twoRimeGen() + twoRimeGen() + threeRimeGen();
        return sentence.substring(0, 1).toUpperCase() + sentence.substring(1);
    }

    public static void main(String[] args) {
        Limericks sentenceGeneration = new Limericks();
        for (int i = 0; i < 20; i++) {
            System.out.println(sentenceGeneration.randomSentence());
        }
    }
}
