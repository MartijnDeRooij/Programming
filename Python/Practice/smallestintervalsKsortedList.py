# https://www.dailycodingproblem.com/blog/smallest-interval-of-k-sorted-lists/

# Naive Solution
# The brute force solution is to compare every pair of elements in the lists and consider their intervals. After finding the interval, traverse every list to make sure there is at least one element contained by this interval. In order to find the smallest such interval, we’ll need to store the smallest seen so far, and update if we see a smaller interval.

# This would be an expensive O(N^3), where N is the total amount of elements in all K lists. There are N^2 intervals, and in each one we need to do a linear scan to determine if the interval contains elements from all K lists. On the bright side, this solution uses O(1) memory, since it only needs to store the current smallest interval.

#Solution 1: K-Pointers
#The problem statement itself gives us two hints: the lists are all sorted, and we need to return the smallest interval if there are multiple. This suggests iterating over the arrays from beginning (smallest elements) to end (largest elements).

#Imagine we compared the minimum values of all the arrays. In the example above, these values would be [0, 5, 0], and the interval would be the minimum and maximum of these values: [0, 5]. Note that this is guaranteed to contain an element from each of the arrays.

#This is one such interval, but we’re not sure yet if this is the smallest interval, so we must keep looking. Since the values are already the minimum values of all the arrays, there is no way to decrease the interval by reducing the maximum value, e.g. [0, 4] or [0, 3]. Thus, we must step along by increasing the minimum. In this case, the next interval we should consider is [1, 5].

#To translate this into an algorithm:

#Initialize K pointers, one for each of the K lists, pointing to the minimum element of the list.
#Initialize variables to track the right and left boundaries of the interval.
#Find the pointer that points to the minimum and the pointer that points to the maximum of all values pointed to. This is your interval.
#If this interval is smaller than the current tracked interval, update your tracked interval to be this interval.
#Increment the pointer that points to the minimum value. Note that after incrementing this pointer, it may not point to a minimum value anymore.
#Repeat steps 3 - 5 until we’ve finished scanning one of the lists.

def smallest_interval(nums):
    # initialize pointers array
    pointers = [0] * len(nums)
    ans = -inf, inf

    while True:
        # initialize local variables and end conditions
        local_max = -inf
        local_min = inf
        local_min_index = -1
        reached_end = False

        # iterate over the pointers array
        for i in xrange(len(pointers)):

            # stop looking if we’ve reached the end of a list
            if pointers[i] >= len(nums[i]):
                reached_end = True
                break

            # calculate the maximum
            if nums[i][pointers[i]] > local_max:
                local_max = nums[i][pointers[i]]

            # calculate the minimum and index of the minimum.
            # index here means which list the minimum is in.
            if nums[i][pointers[i]] < local_min:
                local_min = nums[i][pointers[i]]
                local_min_index = i


        # if we reached the end of any list, we know we’ve already found the optimal interval.
        if reached_end:
            break

        # if the new interval is smaller, update ans
        if local_max - local_min < ans[1] - ans[0]:
            ans = local_min, local_max

        # increment the pointer of the minimum value
        pointers[local_min_index] = pointers[local_min_index] + 1

    return ans

#Solution 2: Heap
#Note that in the above, much of the work in the inner loop is spent trying to find the local maximum and local minimum values. Fortunately, we can use a heap to simplify this!

#If we used a heap instead of an array of pointers to track the values we are currently looking at, we would be able to find the local minimum in O(1) time. However, we still need to know which list the local minimum is from: for this, we can make use of Python’s tuple capabilities.

#Consider a min-heap (a heap where the first element is guaranteed to be the minimum of all elements in the heap) consisting of tuples that hold the following information: (value, which list it is from, index of value in that list)

#Now, let’s see how we can adapt the algorithm above to use a heap instead.

#Initialize a heap of size K, with all the tuples being: (first value of the list, which list it is from, 0). The zero here is because we are starting at all the minimum values, so index 0.
#Initialize variables to track the right and left boundaries of the interval.
#Initialize the local_maximum variable to the max of the first set of values. Since we are using a min-heap, there is no easy way to retrieve the maximum value, so we will need to track it.
#Pop an element from the top of the heap. The element contains the local_minimum, list it is from, and index within that list.
#Compare the new range (local_maximum - local_minimum) and update the current tracked interval if necessary.
#Increment the local_minimum’s index, and read the value.
#If the value is larger than the local_maximum, update the local_maximum. This sets it up so that the next iteration has an updated version of local_maximum.
#Create a heap element using the new value, and insert it into the heap.
#Repeat steps 4-8 until we’ve exhausted a list.

def smallest_interval(nums):
	# initialize heap. each tuple contains (value, which list it is from, index within that list)
	heap = [(row[0], i, 0) for i, row in enumerate(nums)]
	heapq.heapify(heap)

	# initialize local_maximum and answer
	local_maximum = max(row[0] for row in nums)
	ans = [-inf, inf]
	while heap:
		# pop local_minimum from the heap
		local_minimum, num_list, local_min_index = heapq.heappop(heap)

		# if the new interval is smaller than tracked interval, update tracked interval
		if local_maximum - local_minimum < ans[1] - ans[0]:
			ans = [local_minimum, local_maximum]

		# if we've reached the end of this list, we know we've seen all possible intervals.
		if local_min_index + 1 == len(nums[num_list]):
			return ans

		# increment the local_min_index and recalculate local_maximum
		next_val = (nums[num_list][local_min_index +1])
		local_maximum = max(new_val, local_maximum)

		# push the new element onto the heap
		heapq.heappush(heap, (next_val, num_list, local_min_index+1))