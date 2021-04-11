class IssueReplyModel {
  String replycontent;
  int addtime;
  String userimage;
  String issuecontentid;
  String replyname;
  String nickname;
  String issuereplyid;
  String userid;
  int stick;
  IssueReplyModel(
      {this.replycontent,
        this.addtime,
        this.userimage,
        this.issuecontentid,
        this.replyname,
        this.nickname,
        this.issuereplyid,this.stick,
        this.userid});

  IssueReplyModel.fromJson(Map<String, dynamic> json) {
    replycontent = json['replycontent'];
    addtime = json['addtime'];
    userimage = json['userimage'];
    issuecontentid = json['issuecontentid'];
    replyname = json['replyname'];
    nickname = json['nickname'];
    issuereplyid = json['issuereplyid'];
    userid = json['userid'];
    stick = json['stick'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['replycontent'] = this.replycontent;
    data['addtime'] = this.addtime;
    data['userimage'] = this.userimage;
    data['issuecontentid'] = this.issuecontentid;
    data['replyname'] = this.replyname;
    data['nickname'] = this.nickname;
    data['issuereplyid'] = this.issuereplyid;
    data['userid'] = this.userid;
    data['stick'] = this.stick;
    return data;
  }
}

