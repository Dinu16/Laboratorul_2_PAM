import 'package:get/get.dart';
import 'package:lab_2/list_items/course_details_item.dart';
import 'package:lab_2/list_items/course_details_list_item.dart';
import 'package:lab_2/list_items/description_list_item.dart';
import 'package:lab_2/list_items/enroll_list_item.dart';
import 'package:lab_2/list_items/section_details_list_item.dart';
import 'package:lab_2/list_items/skills_item.dart';
import 'package:lab_2/list_items/skills_list_item.dart';
import 'package:lab_2/list_items/start_trial_list_item.dart';
import 'package:lab_2/list_items/title_price_item.dart';
import 'package:lab_2/list_items/video_details_list_item.dart';

import '../list_items/list_item.dart';
import '../list_items/spacer_item.dart';

class DisplayPageController extends GetxController {
  RxList<ListItem> items = RxList();

  @override
  void onInit() {
    super.onInit();
    addItems();
  }

  void addItems() {
    items.add(VideoDetailsListItem(
        imagePath: "lib/img/continue_watching/course1.jpg", saved: true));

    items.add(SpacerItem(height: 21));

    items.add(TitlePriceItem(
      title: 'Typography and Layout Design',
      publisher: 'Visual Communication College',
      studentsEnrolled: 3400,
      price: 35,
    ));

    items.add(SpacerItem(height: 20));

    items.add(SectionDetailsListItem(title: 'Course Details'));

    items.add(SpacerItem(height: 10));

    items.add(DescriptionListItem(
        description:
            "'Visual Communication College's Typography and Layout Design course explores the art and science of typography and layout composition. Learn how to effectively use typefaces, hierarchy, alignment, and grid systems to create visually compelling designs. Gain hands-on experience in editorial design, branding, and digital layouts"));

    items.add(SpacerItem(height: 28));

    items.add(CourseDetailsListItem(detailsList: [
      CourseDetailsItem(
          icon: 'lib/img/details/book-fill.png',
          title: "Lectures",
          details: "50+ Lectures"),
      CourseDetailsItem(
          icon: 'lib/img/details/time-fill.png',
          title: "Learning Time",
          details: "4 weeks"),
      CourseDetailsItem(
          icon: 'lib/img/details/award-fill.png',
          title: "Certification",
          details: "Online Certificate")
    ]));

    items.add(SpacerItem(height: 24));

    items.add(SectionDetailsListItem(title: 'Skills'));

    items.add(SpacerItem(height: 10));
    
    items.add(SkillsListItem(skillsList: [
      SkillsItem(title: 'Typography'),
      SkillsItem(title: 'Layout Composition'),
      SkillsItem(title: 'Branding'),
      SkillsItem(title: 'Visual Communication'),
      SkillsItem(title: 'Editorial design'),
    ]));

    items.add(SpacerItem(height: 35));

    items.add(EnrollListItem());

    items.add(SpacerItem(height: 20));

    items.add(StartTrialListItem());
  }
}
