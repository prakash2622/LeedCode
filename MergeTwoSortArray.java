import java.util.Arrays;

public class MergeSortArray {
	public static void main(String[] args) {
		int a[] = { 1, 5, 6, 9, 12 };
		int b[] = { 2, 3, 7 };
		
		int[] c = mergeArrays(a, b);
		System.out.println(Arrays.toString(c));
	}

	public static int[] mergeArrays(int[] a, int[] b) {
		int c[] = new int[a.length + b.length];
		int i = 0, j = 0, k = 0;
		while (i < a.length && j < b.length) {//0<8 //1<8
			if (a[i] < b[j])//1<2 //5<2
				c[k++] = a[i++];//1
			else
				c[k++] = b[j++];//2
		}
		while (i < a.length)
			c[k++] = a[i++];
		while (j < b.length)
			c[k++] = b[j++];
		return c;
	}
}
