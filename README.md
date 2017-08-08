# An ALVINN Inspired Neural Network Autonomous Driving Simulation

use of a simple neural network to drive a vehicle dynamic simulation autonomously by looking at the 2D road image and output the steering command

![result](/./results/nn-drive-4.gif)

## to run pretrained model
run `nn/nn_car_sim.m`

## to train a model
use `sim/drift_sim.m` to record training data (manual driving)  
use `preprocess/preprocess.m` to process data
use `nn/train_car.m` to train neural Networks

## implementation details
see [`report.pdf`](/./report.pdf)
