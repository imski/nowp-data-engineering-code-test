package com.nowpensions;

import java.util.ArrayList;
import java.util.List;

public class SentenceGenerator {
    public static String generateSentences(List<String> subjects, List<String> predicates, List<String> objects) {

        List<String> listSubjects = new ArrayList<String>(subjects);
        List<String> listPredicates = new ArrayList<String>(predicates);
        List<String> listObjects = new ArrayList<String>(objects);

        listSubjects.sort(null);
        listPredicates.sort(null);
        listObjects.sort(null);

        String resultString = "";
        String separator = "";
        for (String thesubject : listSubjects) {
            for (String thepredicate : listPredicates) {
                for (String theobject : listObjects) {
                    String sentence = "";
                    sentence = sentence.concat(separator).concat(thesubject).concat(" ").concat(thepredicate).concat(" ").concat(theobject).concat(".");
                    resultString = resultString.concat(sentence);
                    // set separator to space after first sentence is written.
                    separator = " ";
                }
            }
        }
        return resultString;
    }
}
