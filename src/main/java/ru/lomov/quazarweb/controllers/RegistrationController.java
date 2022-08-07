package ru.lomov.quazarweb.controllers;

import freemarker.template.utility.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import ru.lomov.quazarweb.dto.CaptchaResponseDto;
import ru.lomov.quazarweb.entities.User;
import ru.lomov.quazarweb.services.UserService;

import javax.validation.Valid;
import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    private final static String CAPTCHA_URL="https://www.google.com/recaptcha/api/siteverify?secret=%s&response=%s";
    @Autowired
    private UserService userService;
    @Autowired
    private RestTemplate restTemplate;

    @Value("${recaptcha.secret}")
    private String secret;
    @GetMapping("/registration")
    public String registration(){
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(
            @RequestParam("password2") String passwordConfirmation,
            @RequestParam("g-recaptcha-response") String captchaResponse,
            @Valid User user,
            BindingResult bindingResult,
            Model model){
        String url = String.format(CAPTCHA_URL, secret, captchaResponse);
        CaptchaResponseDto response = restTemplate.postForObject(url, Collections.emptyList(), CaptchaResponseDto.class);

        if (!response.isSuccess()){
            model.addAttribute("captchaError", "Заполни капчу!");
        }

        boolean isConfirmEmpty = StringUtils.isEmpty(passwordConfirmation);
        if (isConfirmEmpty){
            model.addAttribute("password2Error", "Пароли не совпадают!");
        }
        if (user.getPassword() != null && !user.getPassword().equals(passwordConfirmation)){
            model.addAttribute("passwordError","Пароли не совпадают!");
            return "registration";
        }
        if (isConfirmEmpty || bindingResult.hasErrors() || !response.isSuccess()){
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }
        if (!userService.addUser(user)){
            model.addAttribute("usernameError", "Такой пользователь уже существует!");
            return "registration";
        }
        return "redirect:/login";
    }
    @GetMapping("/activate/{code}")
    public String activate(Model model, @PathVariable String code){
        boolean isActivated = userService.activateUser(code);
        if (isActivated){
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Аккаунт пользователя успешно активирован!");
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Код активации не найден!");

        }
        return "login";
    }
}
