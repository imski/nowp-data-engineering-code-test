package com.nowpensions;

public class Airplane {
    private int coordinate_X, coordinate_Y, current_consumption;
    private float current_fuel_level;

    public Airplane(int initX, int initY, int consumption, float fuel_level) {
        coordinate_X = initX; //km in dim x
        coordinate_Y = initY; //km in dim Y
        current_consumption = consumption; // in l/km
        current_fuel_level = fuel_level; // in l
    }

    public boolean go_to(int posX, int posY) {
        // do have fuel to make it
        // returns true and changes position or returns false
        float fuel_required;
        fuel_required = (float) (Math.sqrt(Math.pow((posX - coordinate_X), 2) + Math.pow((posY - coordinate_Y), 2)) * current_consumption);


        if (fuel_required < current_fuel_level) {
            current_fuel_level = (current_fuel_level - fuel_required);
            coordinate_X = posX;
            coordinate_Y = posY;
            return true;
        } else return false;
    }

    public void refuel(int addLiters) {
        current_fuel_level = current_fuel_level + addLiters;
    }
}