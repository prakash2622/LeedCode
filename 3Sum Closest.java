 public int threeSumClosest(int[] nums, int target) {
        int n = nums.length;
    Arrays.sort(nums);
        int ans = 0;
        int diff = 1000;
        for (int i = 0; i < n - 2; i++) {
            int j = i + 1, k = n - 1;
            while (j < k) {
                int sum = nums[i] + nums[j] + nums[k];
                if (Math.abs(sum - target) < diff) {
                    diff = Math.abs(sum - target);
                    ans = sum;
                }
               if (sum < target) {
                    j++;
                } else {
                    k--;
                }
            }
        }
        return ans;
