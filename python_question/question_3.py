class PatternPrinter:
    def __init__(self, N, M):
        self.N = N
        self.M = M

    def print_pattern(self):
        for i in range(1, self.N, 2):
            print((i * ".|.").center(self.M, "-"))
        print("WELCOME".center(self.M, "-"))
        for i in range(self.N - 2, -1, -2):
            print((i * ".|.").center(self.M, "-"))



