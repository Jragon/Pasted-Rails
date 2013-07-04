PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20130703145448');
INSERT INTO "schema_migrations" VALUES('20130703145718');
CREATE TABLE "pastes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "content" text, "language_id" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "pastes" VALUES(2,'Lorem Ipsum','Lorem ipsum Adipisicing ut anim magna ut do Excepteur laboris Ut reprehenderit Ut eiusmod in labore laboris sed occaecat veniam culpa ea est esse esse magna ullamco incididunt dolore ex sint et in dolor aute fugiat sunt est ut dolor cillum sit sint cupidatat cupidatat do commodo minim aute voluptate dolor dolor aute in id velit ut elit quis dolor voluptate reprehenderit ut irure tempor sit sint adipisicing aute ut laboris sunt in eiusmod id officia eiusmod laborum Duis exercitation irure ullamco eu voluptate adipisicing proident mollit eu aliquip officia elit aliquip sit dolore elit eiusmod est Duis laborum enim nulla ex sint deserunt aliqua dolor ullamco labore Excepteur Excepteur occaecat nostrud laboris ad cupidatat dolor enim culpa nostrud proident sint ad et deserunt tempor ut in labore nisi Ut voluptate incididunt ea irure deserunt reprehenderit minim eiusmod quis dolor do enim aute id minim minim reprehenderit Duis culpa tempor adipisicing commodo id ad incididunt incididunt culpa sint ut minim est voluptate do exercitation ut aliqua nostrud fugiat ut reprehenderit ea fugiat fugiat qui enim fugiat.','2','2013-07-03 15:36:51.805378','2013-07-03 15:36:51.805378');
INSERT INTO "pastes" VALUES(3,'Hello world','def hello_world
  puts "Hello World"
end','1','2013-07-03 16:31:49.701522','2013-07-03 16:31:49.701522');
INSERT INTO "pastes" VALUES(4,'Big model','class AvailabilityObserver < ActiveRecord::Observer

  def after_create availability
   send_local_mailout availability
  end

  def send_local_mailout availability
    available_from_lat_radians = (availability.available_from_lat/180) * Math::PI
    available_from_lng_radians = (availability.available_from_lng/180) * Math::PI
    return_to_lat_radians = (availability.return_to_lat/180) * Math::PI
    return_to_lng_radians = (availability.return_to_lng/180) * Math::PI

    user_ids = []
    user_id_select = [User, Depot].inject([]) do |arr, model|
      available_from_results = model.search :geo => [available_from_lat_radians, available_from_lng_radians], 
                             :with => {"@geodist" => 0.0..80_000.0}   
      return_to_results = model.search :geo => [return_to_lat_radians, return_to_lng_radians], 
                             :with => {"@geodist" => 0.0..80_000.0}   
      [available_from_results, return_to_results].each do |results|
        arr << results.each do |result|
          if model == Depot
            user_ids << result.user_id unless result.nil?
            user_ids << result.users.map(&:id) unless result.nil?
          else
            user_ids << result.id unless result.nil?
          end
        end
      end
      arr
    end    
    
    users = User.where(:id => user_ids)
    users.each do |user|
      unless (user == availability.user || user == availability.user.parent)
        UserMailer.new_local_advertised_availability(availability, user).deliver
      end
    end
  
  end

end
','1','2013-07-03 16:41:57.958703','2013-07-03 16:41:57.958703');
INSERT INTO "pastes" VALUES(5,'PHP really does suck','<?php

echo ''why would anyone ever use php?''

?>','3','2013-07-03 16:42:51.983143','2013-07-03 16:42:51.983143');
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO "languages" VALUES(1,'Ruby','2013-07-03 15:15:50.883949','2013-07-03 15:15:50.883949');
INSERT INTO "languages" VALUES(2,'Plain','2013-07-03 15:15:57.889515','2013-07-03 15:15:57.889515');
INSERT INTO "languages" VALUES(3,'PHP','2013-07-03 15:16:02.416870','2013-07-03 15:16:02.416870');
INSERT INTO "languages" VALUES(4,'C','2013-07-04 08:17:16.310746','2013-07-04 08:19:28.979066');
INSERT INTO "languages" VALUES(5,'C++','2013-07-04 08:17:20.664759','2013-07-04 08:19:51.904207');
INSERT INTO "languages" VALUES(6,'CSS','2013-07-04 08:17:30.727252','2013-07-04 08:17:30.727252');
INSERT INTO "languages" VALUES(7,'Delphi','2013-07-04 08:17:37.846585','2013-07-04 08:17:37.846585');
INSERT INTO "languages" VALUES(8,'ERB','2013-07-04 08:17:44.925889','2013-07-04 08:17:44.925889');
INSERT INTO "languages" VALUES(9,'Groovy','2013-07-04 08:17:50.445287','2013-07-04 08:17:50.445287');
INSERT INTO "languages" VALUES(10,'HAML','2013-07-04 08:17:54.652786','2013-07-04 08:17:54.652786');
INSERT INTO "languages" VALUES(11,'HTML','2013-07-04 08:17:58.420526','2013-07-04 08:17:58.420526');
INSERT INTO "languages" VALUES(12,'Java','2013-07-04 08:18:02.355976','2013-07-04 08:18:02.355976');
INSERT INTO "languages" VALUES(13,'JavaScript','2013-07-04 08:18:05.123703','2013-07-04 08:18:05.123703');
INSERT INTO "languages" VALUES(14,'JSON','2013-07-04 08:18:11.219241','2013-07-04 08:18:11.219241');
INSERT INTO "languages" VALUES(15,'Python','2013-07-04 08:18:18.818408','2013-07-04 08:18:18.818408');
INSERT INTO "languages" VALUES(16,'SQL','2013-07-04 08:18:32.609178','2013-07-04 08:18:32.609178');
INSERT INTO "languages" VALUES(17,'XML','2013-07-04 08:18:35.680592','2013-07-04 08:18:35.680592');
INSERT INTO "languages" VALUES(18,'YAML','2013-07-04 08:18:39.936288','2013-07-04 08:18:39.936288');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('languages',18);
INSERT INTO "sqlite_sequence" VALUES('pastes',5);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
COMMIT;
