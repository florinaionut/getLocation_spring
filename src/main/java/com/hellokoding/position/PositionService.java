package com.hellokoding.position;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @author radu.miron
 * @since 18.10.2016
 */
@Service
public class PositionService {
    @Autowired
    private PositionRepository positionRepository;

    @Transactional(propagation = Propagation.REQUIRED)
    public Position savePosition(Position position) {
        return positionRepository.save(position);
    }


    @Transactional(propagation = Propagation.REQUIRED)
    public List<Position> findPositionByDateAndTerminalId(String terminalId, Date startDate, Date endDate) {
        return positionRepository.findByTerminalIdAndStartDateAndEndDate(terminalId, startDate, endDate);

    }

    public Position getPosition(Long position_id) {
        return positionRepository.findOne(position_id);
    }

//    public Position updatePosition(Position position) {
//        return positionRepository.save(position);
//    }


    public Position deletePosition(Long position_id) {
        Position position = getPosition(position_id);
        if (position != null) {
            positionRepository.delete(position_id);
        } else {
            throw new IllegalArgumentException("position does not exist");
        }
        return position;
    }

}
