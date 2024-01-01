public class SentenceGeneration {
    String[] article = { "the", "a", "one", "some", "any" };
    String[] noun = { "boy", "girl", "dog", "town", "car" };
    String[] verb = { "drove", "jumped", "ran", "walked", "skipped" };
    String[] preposition = { "to", "from", "over", "under", "on" };

    int randomNum(int min, int max) {
        return (int) (Math.random() * (max - min + 1) + min);
    }

    String randomArticle() {
        return article[randomNum(0, article.length - 1)];
    }

    String randomNoun() {
        return noun[randomNum(0, noun.length - 1)];
    }

    String randomVerb() {
        return verb[randomNum(0, verb.length - 1)];
    }

    String randomPreposition() {
        return preposition[randomNum(0, preposition.length - 1)];
    }

    String randomSentence() {
        String sentence = randomArticle() + " " + randomNoun() + " " + randomVerb() + " " + randomPreposition() + " "
                + randomArticle() + " " + randomNoun() + ".";
        return sentence.substring(0, 1).toUpperCase() + sentence.substring(1);
    }

    public static void main(String[] args) {
        SentenceGeneration sentenceGeneration = new SentenceGeneration();
        for (int i = 0; i < 20; i++) {
            System.out.println(sentenceGeneration.randomSentence());
        }
    }
}
