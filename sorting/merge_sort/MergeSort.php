<?php

/*
// Josh Campoverde
// joshcampoverde@gmail.com
// October 13, 2010
//
// Merge Sort
// Worst case performance: O(n*log(n))
// Best case performance: O(n*log(n))
// Average case performance: O(n*log(n))
// Worst case space complexity: O(n)
// Wikipedia link: http://en.wikipedia.org/wiki/Merge_sort
*/

// tested and functional
function merge($left, $right)
{
    $result = array();

    while ((count($left) > 0) || (count($right) > 0))
    {
        if ((count($left) > 0) && (count($right) > 0))
        {
            if ($left[0] <= $right[0])
            {
                $leftValue = array_shift($left);
                $result[] = $leftValue;
            } else {
                $rightValue = array_shift($right);
                $result[] = $rightValue;
            }
        } else if (count($left) > 0) {
            $result = array_merge($result, $left);
            break;
        } else if (count($right) > 0) {
            $result = array_merge($result, $right);
            break;
        }
    }
    return $result;
}

/* Tests for merge() help function
$mergeArr1 = array(4,3,2);
$mergeArr2 = array(5,2);
print_r(merge($mergeArr1,$mergeArr2));
*/


// tested and functional
function merge_sort($arr)
{
    if (count($arr) <= 1)
    {
        return $arr;
    }

    $left = array();
    $right = array();
    $result = array();

    $middle = count($arr) / 2;

    for($i = 0; $i <= count($arr) - 1; $i++)
    {
        if ($i < $middle)
        {
            $left[] = $arr[$i];
        } else {
            $right[] = $arr[$i];
        }
    }

    $left = merge_sort($left);
    $right = merge_sort($right);
    $result = merge($left,$right);

    return $result;
}

// Very basic test code
// $array = array(-3,100,0,0,0,0,-4,2,1,998,5);
// $sortedArray = merge_sort($array);

// print "Unsorted array:\n";
// print_r($array);
// print "\n";
// print "Sorted array:\n";
// print_r($sortedArray);
