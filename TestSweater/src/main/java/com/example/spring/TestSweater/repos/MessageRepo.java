package com.example.spring.TestSweater.repos;

import com.example.spring.TestSweater.model.Message;
import com.example.spring.TestSweater.model.User;
import com.example.spring.TestSweater.model.dto.MessageDto;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface MessageRepo extends CrudRepository<Message, Long> {

    @Query("select new com.example.spring.TestSweater.model.dto.MessageDto(" +
            " m, " +
            " count(ml), " +
            " sum(case when ml= :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "group by m")
    Page<MessageDto> findAll(Pageable pageable,  @Param("user") User user);

    @Query("select new com.example.spring.TestSweater.model.dto.MessageDto(" +
            " m, " +
            " count(ml)," +
            " sum(case when ml= :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.author = :user " +
            "group by m")
    Page<MessageDto> findByAuthor(Pageable pageable, @Param("user") User user);

    @Query("select new com.example.spring.TestSweater.model.dto.MessageDto(" +
            " m, " +
            " count(ml)," +
            " sum(case when ml= :user then 1 else 0 end) > 0" +
            ") " +
            "from Message m left join m.likes ml " +
            "where m.tag = :tag " +
            "group by m")
    Page<MessageDto> findByTag(@Param("tag") String tag, Pageable pageable, @Param("user") User user);
}
