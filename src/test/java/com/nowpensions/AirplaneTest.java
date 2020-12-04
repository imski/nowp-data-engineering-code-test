package com.nowpensions;

import org.junit.Test;

import static org.junit.Assert.*;

public class AirplaneTest {

    @Test
    public void testGoto(){
        Airplane plane = new Airplane(1,1, 30, 1000 );
        assertTrue(plane.go_to(30, 1));
    }
    @Test
    public void testGotoInsufficientFuel(){
        Airplane plane = new Airplane(1,1, 30, 1000 );
        assertFalse(plane.go_to(1, 50));
    }

    @Test
    public void testReFuel(){
        Airplane plane = new Airplane(1,1, 30, 1000 );
        assertFalse(plane.go_to(1, 50));
        if (!plane.go_to(1,50)) {
            plane.refuel(1000);
        }
        assertTrue(plane.go_to(1, 50));
    }


}