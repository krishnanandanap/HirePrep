package com.interview.controller;

import com.interview.dto.AuthDTOs;
import com.interview.entity.User;
import com.interview.repository.UserRepository;
import com.interview.security.JwtUtil;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;

    public AuthController(UserRepository userRepository,
                          PasswordEncoder passwordEncoder,
                          JwtUtil jwtUtil) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.jwtUtil = jwtUtil;
    }

    // POST /api/auth/register
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody AuthDTOs.RegisterRequest request) {
        if (userRepository.existsByEmail(request.getEmail())) {
            return ResponseEntity.badRequest()
                    .body(AuthDTOs.AuthResponse.builder().message("Email already registered").build());
        }

        User user = User.builder()
                .name(request.getName())
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .build();

        User saved = userRepository.save(user);
        String token = jwtUtil.generateToken(saved.getEmail(), saved.getId());

        return ResponseEntity.ok(AuthDTOs.AuthResponse.builder()
                .token(token)
                .userId(saved.getId())
                .name(saved.getName())
                .email(saved.getEmail())
                .message("Registration successful")
                .build());
    }

    // POST /api/auth/login
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthDTOs.LoginRequest request) {
        return userRepository.findByEmail(request.getEmail())
                .filter(user -> passwordEncoder.matches(request.getPassword(), user.getPassword()))
                .map(user -> {
                    String token = jwtUtil.generateToken(user.getEmail(), user.getId());
                    return ResponseEntity.ok(AuthDTOs.AuthResponse.builder()
                            .token(token)
                            .userId(user.getId())
                            .name(user.getName())
                            .email(user.getEmail())
                            .message("Login successful")
                            .build());
                })
                .orElse(ResponseEntity.status(401)
                        .body(AuthDTOs.AuthResponse.builder().message("Invalid email or password").build()));
    }
}
