/*
 * Timer.h
 *
 *  Created on: 04/05/2013
 *      Author: Vitor
 */

#ifndef TIMER_H_
#define TIMER_H_

#include <chrono>

typedef std::chrono::time_point<std::chrono::system_clock,
		std::chrono::duration<uint64_t, std::nano>> time_var;

class Timer {
private:
	bool done;
	bool paused;
	bool started;
	time_var goalTimeInNanoseconds;
	time_var pausedTimeInMilliseconds;

public:
	Timer();

	void start(int newGoalTimeInMilliseconds);
	void resume();
	void pause();
	void update();
	std::chrono::duration<uint64_t, std::nano> remainingTime();

	bool isDone() const {
		return done;
	}
};

#endif /* TIMER_H_ */
