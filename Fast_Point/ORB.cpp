#include <opencv2/core/core.hpp>
#include <opencv2/features2d/features2d.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc/types_c.h>
#include <vector>

using namespace cv;
using namespace std;

int main()
{
	Mat img = imread("C:\\Users\\cymfg\\Desktop\\timg.png");
	Mat GrayImg;
	if (img.channels() == 3)
	{
		cvtColor(img, GrayImg, CV_RGB2GRAY);
	}
	else
	{
		img.copyTo(GrayImg);
	}
	imshow("nature", GrayImg);
	vector<KeyPoint> keypoints;
	Ptr<FastFeatureDetector> fast = FastFeatureDetector::create(10);
	fast->detect(GrayImg, keypoints);

	Mat img_keypoints;
	drawKeypoints(GrayImg, keypoints, img_keypoints, Scalar::all(-1), DrawMatchesFlags::DEFAULT);

	imshow("Keypoints", img_keypoints);
	imwrite("fast_detection_result.png", img_keypoints);

	waitKey(0);
	return 0;
}
