package com.codebay.goldeneye;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;

@Controller
public class WebController {
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @RequestMapping("/email")
    public String generateEmail(String name, String surname, String city, String departament, Model model) {

        String F = name.substring(0, 1);
        String SUR = surname;
        String DEP = departament;
        String Location = city;
        String goldenEye = "GoldenEye.com";

        String email = F + SUR + "." + DEP + "@" + Location + "." + goldenEye;

        email = email.toLowerCase();

        model.addAttribute("email", email);
        return "email";
    }

    /*
     * ---------Here we hava a simulation of bad words, we will take for ur
     * API--------
     * 
     * public static String filterInappropriateWords(String text) {
     * Llamar a la API externa para obtener la lista de palabras inapropiadas
     * String[] inappropriateWords = badWordsFromApi();
     * 
     * for (String word : inappropriateWords) {
     * if (text.contains(word)) {
     * return "Inapropiada";
     * }
     * }
     * 
     * private static String[] badWordsFromApi() {
     * // Here we do the call to the API .
     * return new String[] { "BW1", "BW2", "BW3" };
     * };
     */

}
