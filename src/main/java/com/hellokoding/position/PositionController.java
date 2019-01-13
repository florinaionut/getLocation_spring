package com.hellokoding.position;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * @author radu.miron
 * @since 18.10.2016
 */
@RestController
@RequestMapping(value = "/position")
public class PositionController {
    @Autowired
    private PositionService positionService;



    @RequestMapping(method = RequestMethod.POST)
    public Position save(@RequestBody Position position) {
        if (position.getId() != null) {
            throw new IllegalArgumentException("Invalid 'id' value. It should be empty");
        }
        return positionService.savePosition(position);
    }

//    @RequestMapping(method = RequestMethod.GET)
//    public Position get(@RequestParam Long position) {
//        return positionService.getPosition(position);
//    }

    @RequestMapping(method = RequestMethod.GET)
    public List<Position> find(@RequestParam String terminalId,
                               @RequestParam @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")Date startDate,
                               @RequestParam @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")Date endDate) {
        return positionService.findPositionByDateAndTerminalId(terminalId, startDate, endDate);
    }

    @RequestMapping(method = RequestMethod.PUT)
    public Position update(@RequestBody Position position) {
        return positionService.savePosition(position);
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public Position delete(@RequestParam Long position_id) {
        return  positionService.deletePosition(position_id);
    }
}


