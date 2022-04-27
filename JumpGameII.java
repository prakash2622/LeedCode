public class JumpGameII {
	public static void main(String[] args) {
		int nums[] = { 2, 3, 1, 1, 4 };
		int findex = 0, jump = 0, lindex = 0;
		for (int i = 0; i < nums.length-1; i++) {
			lindex = Math.max(lindex, i + nums[i]);
			if (findex == i) {
				jump++;
				findex = lindex;
			}
		}
		System.out.println(jump);
	}
}
