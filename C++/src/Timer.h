/*
 * Timer.h
 *
 *  Created on: 04/05/2013
 *      Author: Vitor
 */

#ifndef TIMER_H_
#define TIMER_H_

#include <SDL2/SDL.h>

class Timer {
private:
	bool done;
	bool paused;
	bool started;
	unsigned int goalTimeInMilliseconds;
	unsigned int pausedTimeInMilliseconds;
public:
	Timer();
	virtual ~Timer();

	void start(int newGoalTimeInMilliseconds);
	void resume();
	void pause();
	void update();
	unsigned int remainingTime();

	bool isDone() const {
		return done;
	}
};

#endif /* TIMER_H_ */
