/*
 * Timer.cpp
 *
 *  Created on: 04/05/2013
 *      Author: Vitor
 */

#include "Timer.h"

using namespace std::chrono;

Timer::Timer() {
	done = false;
	paused = false;
	started = false;
}

void Timer::update() {
	auto now = high_resolution_clock::now();
	if (!done && !paused && started && now >= goalTimeInNanoseconds) {
		done = true;
		started = false;
	}
}

void Timer::start(int newGoalTimeInMilliseconds) {
	newGoalTimeInMilliseconds *= 1000000;
	auto now = high_resolution_clock::now();
	this->goalTimeInNanoseconds = now
			+ duration<uint64_t, std::nano>(newGoalTimeInMilliseconds);
	done = false;
	paused = false;
	started = true;
}

void Timer::pause() {
	if (!paused && started) {
		paused = true;
		pausedTimeInMilliseconds = high_resolution_clock::now();
	}
}

void Timer::resume() {
	if (paused) {
		paused = false;
		goalTimeInNanoseconds = goalTimeInNanoseconds
				+ (high_resolution_clock::now() - pausedTimeInMilliseconds);
	}
}

duration<uint64_t, std::nano> Timer::remainingTime() {
	if (done || !started) {
		return duration<uint64_t, std::nano>(0);
	}
	if (paused) {
		return goalTimeInNanoseconds - pausedTimeInMilliseconds;
	}
	auto now = high_resolution_clock::now();
	return goalTimeInNanoseconds - now;
}
