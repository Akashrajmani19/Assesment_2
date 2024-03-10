class HorsePlacement:
    def __init__(self, stalls, k):
        self.stalls = sorted(stalls)
        self.k = k

    def min_distance_between_horses(self):
        left, right = 0, self.stalls[-1] - self.stalls[0]
        result = 0

        while left <= right:
            mid = (left + right) // 2
            if self._is_valid(mid):
                result = mid
                left = mid + 1
            else:
                right = mid - 1

        return result

    def _is_valid(self, min_distance):
        horses_placed = 1
        last_placed_index = 0

        for i in range(1, len(self.stalls)):
            if self.stalls[i] - self.stalls[last_placed_index] >= min_distance:
                horses_placed += 1
                last_placed_index = i
            if horses_placed == self.k:
                return True

        return False





