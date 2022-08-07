package ru.lomov.quazarweb.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.lomov.quazarweb.entities.Message;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
   List<Message> findByTag(String tag);
}
