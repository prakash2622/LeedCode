public int maxArea(int[] height) {
       int left = 0;
        int right = height.length-1;
        int max =  -1;
        while(left<right){
            int width = right-left;
            int ht = Math.min(height[left], height[right]);
            max = Math.max(max,width*ht);
            if(height[left]< height[right])
                left++;    
            else
                right--;
        }
        return max;
