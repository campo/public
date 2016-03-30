<?php

/*
// Josh Campoverde
// joshcampoverde@gmail.com
// October 13, 2010
//
// Bubble Sort
// Worst case performance: O(n^2)
// Best case performance: O(n)
// Average case performance: O(n^2)
// Worst case space complexity: O(1)
// Wikipedia link: http://en.wikipedia.org/wiki/Bubble_sort
*/

function bubbleSort($arr){
    if (count($arr) <= 1)
    {
        return $arr;
    } else {
        $swapped = 1;
        while ($swapped == 1) {
            $swapped = 0;
            for ($i=0; $i<=count($arr)-2; $i++)
            {
                if ($arr[$i] > $arr[$i+1])
                {
                    $largerValue = $arr[$i];
                    $arr[$i] = $arr[$i+1];
                    $arr[$i+1] = $largerValue;
                    $swapped = 1;
                }
            }
        }
        return $arr;
    }
}

// Very basic test code
// $array = array(-3,100,0,0,0,0,-4,2,1,998,5);
// $sortedArray = bubbleSort($array);

// print "Unsorted array:\n";
// print_r($array);
// print "\n";
// print "Sorted array:\n";
// print_r($sortedArray);
