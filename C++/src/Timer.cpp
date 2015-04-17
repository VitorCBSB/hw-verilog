/*
 * Timer.cpp
 *
 *  Created on: 04/05/2013
 *      Author: Vitor
 */

#include "Timer.h"

Timer::Timer() {
	done = false;
	paused = false;
	started = false;
	goalTimeInMilliseconds = 0;
	pausedTimeInMilliseconds = 0;
}

Timer::~Timer() {
}

void Timer::update() {
	if (!done && !paused && started
			&& SDL_GetTicks() >= goalTimeInMilliseconds) {
		done = true;
		started = false;
	}
}

void Timer::start(int newGoalTimeInMilliseconds) {
	this->goalTimeInMilliseconds = SDL_GetTicks() + newGoalTimeInMilliseconds;
	done = false;
	paused = false;
	started = true;
}

void Timer::pause() {
	if (!paused && started) {
		paused = true;
		pausedTimeInMilliseconds = SDL_GetTicks();
	}
}

void Timer::resume() {
	if (paused) {
		paused = false;
		goalTimeInMilliseconds = goalTimeInMilliseconds
				+ (SDL_GetTicks() - pausedTimeInMilliseconds);
	}
}

unsigned int Timer::remainingTime() {
	if (done || !started) {
		return 0;
	}
	if (paused) {
		return goalTimeInMilliseconds - pausedTimeInMilliseconds;
	}
	return goalTimeInMilliseconds - SDL_GetTicks();
}
