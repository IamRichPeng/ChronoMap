ChronoMap
README1:
	ChronoMap is decided to be an IOS application for time management. Now the code is runnable on the latest Xcode (version 10.0) in macOS.

Authors: 
	Ruicheng Peng, Haofan Cui, Shusheng Song, Wenhao Li

Changelog:
	This is the first runnable integration version.
	Now is the second runnable integration version.Changes include:
		1. Fix the bug : When it comes to the pop-up window of adding assignment, user have to enter something (not blank) before they click “post”, otherwise the system will crash down. By using a new viewController instead of pop-up window to add a new assignment. 
		2. Use core data to store Assignments in local data.
		3. Successful convey data between different viewControllers.
		*4. Get rid of "History" section which is considered to be redundant. And now, when user complete an assignment after count-down page, the assignment will turn gray in mission-list. Then user is able to "swipe left and delete" a cell(assignment) in tableview (mission-list).
 ***HIGHLIGHT*** This is also the change compared to Report 3, professor Wei said we can mention it in README. 
		5.Use coredata to store the property and the accumulated reward.
		6.Property will increase every 2 seconds, the speed depends on the accumulated reward.
		7.It will cost homologous property and mention" you have bought this" after users confirm to buy a thing.
		8.Add one more merchandise to our store. 
		9.Fix the countdown page. When countdown begins, there will be not more button or label. The whole page will have no functional button user can control, so that the functional-require is meet.
		10.Add the share with friends function.Now this application can share with friends by copying a screenshot. 
		11.Confirm page Optimization.Notice that the 'compute power' in confirm page now changing with the time set, which is a fixe number in demo 1.
		12. Overall, all the UI interfaces have been optimized.

News:
	This is the first runnable integration version.
	Now is the second runnable integration version.

Install:
	Download the code file and open the .xcodeproject

Copying/License:
	All credits to the authors.

Bugs:   First, the program does not connect 

	Furthermore, because it is on a simulator, the keyboard will not appear automatically. You may click “shift+ command + k” to shows the keyboard then you will notice that when you click the text field of “time”, the number pad will show up, which means you can only enter number there.
	And there are still many functions is not complete yet and we are working on it.
