# 네이버 영화 리뷰 추출(단일 페이지)

# DOM 구조 주요 부분
# Element <tr>
#      |
#      |-------- Element <td>
#      |-------- Element <td> ---------------------Attribute class="title" 
#                          |            |
#                          |            |----- Text "감정을 쥐어 짜지 않으며 .." : 리뷰
#                          |
#                          |-------- Element <a>
#                          |-------- Element <div>
#                                       |
#                                       |-------- Element <span>
#                                              |
#                                              |-------- Element <em> ------- Text "8"  : 리뷰평점

