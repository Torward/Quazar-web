package ru.lomov.quazarweb.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.lomov.quazarweb.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
