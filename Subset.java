import java.util.ArrayList;
import java.util.List;
public class Subset {
	public static void main(String[] args) {
		int nums[] = { 1, 2, 3 };
		List<List<Integer>> arr = new ArrayList<>();
		arr.add(new ArrayList<>());
		for (int i = 0; i < nums.length; i++) {
			int size = arr.size();
			for (int j = 0; j < size; j++) {
			List<Integer> r = new ArrayList<>(arr.get(j));
				r.add(nums[i]);
				arr.add(r);
			}
		}
		System.out.println(arr);
	}
}
